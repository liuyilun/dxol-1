package dxol.util;

/** 
 * 
 * @author liuwei
 * 
 */
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * 
 * @author geloin
 * @date 2012-5-5 下午12:05:57
 */
public class FileOperateUtil {
	private static final String REALNAME = "realName"; // 文件真实名称
	private static final String STORENAME = "storeName"; // 你想存储为哪个名称
	private static final String SIZE = "size"; // 文件大小
	private static final String SUFFIX = "suffix"; // 文件后缀
	private static final String CONTENTTYPE = "contentType"; // 文件的mimeType
	private static final String CREATETIME = "createTime"; // 创建时间
	private static final String UPLOADDIR = "uploadDir/"; // 上传后放在哪个位置

	/**
	 * 将上传的文件进行重命名
	 * 
	 * @author geloin
	 * @date 2012-3-29 下午3:39:53
	 * @param name
	 * @return
	 */
	private static String rename(String name) {

		Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date()));
		Long random = (long) (Math.random() * now);
		String fileName = now + "" + random;

		if (name.indexOf(".") != -1) {
			fileName += name.substring(name.lastIndexOf("."));
		}

		return fileName;
	}

	/**
	 * 压缩后的文件名
	 * 
	 * @author geloin
	 * @date 2012-3-29 下午6:21:32
	 * @param name
	 * @return
	 */
	private static String zipName(String name) {
		String prefix = "";
		if (name.indexOf(".") != -1) {
			prefix = name.substring(0, name.lastIndexOf("."));
		} else {
			prefix = name;
		}
		return prefix + ".zip";
	}

	/**
	 * 上传文件
	 * 
	 * @author geloin
	 * @date 2012-5-5 下午12:25:47
	 * @param request
	 * @param params
	 * @param values
	 * @return
	 * @throws Exception
	 */
	public static List<Map<String, Object>> upload(HttpServletRequest request,
			String[] params, Map<String, Object[]> values) throws Exception {

		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		// 上传文件处理器
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		// 文件列表
		Map<String, MultipartFile> fileMap = mRequest.getFileMap();
		// 获取服务器上传文件夹地址
		String uploadDir = request.getSession().getServletContext()
				.getRealPath("/")
				+ FileOperateUtil.UPLOADDIR;
		System.out.println("~~~~~~~"
				+ request.getSession().getServletContext().getRealPath("/"));
		// 创建文件夹
		File file = new File(uploadDir);

		if (!file.exists()) {
			file.mkdir();
		}

		String fileName = null;
		int i = 0;
		for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet()
				.iterator(); it.hasNext(); i++) {

			Map.Entry<String, MultipartFile> entry = it.next();
			// 单个文件
			MultipartFile mFile = entry.getValue();
			// 文件名
			fileName = mFile.getOriginalFilename();
			// 存储文件名
			String storeName = rename(fileName);

			String noZipName = uploadDir + storeName;
			// 压缩后的文件名
			String zipName = zipName(noZipName);

			// 上传成为压缩文件
			ZipOutputStream outputStream = new ZipOutputStream(
					new BufferedOutputStream(new FileOutputStream(zipName)));
			outputStream.putNextEntry(new ZipEntry(fileName));
			outputStream.setEncoding("GBK");

			FileCopyUtils.copy(mFile.getInputStream(), outputStream);

			Map<String, Object> map = new HashMap<String, Object>(); 
			// 固定参数值对
			map.put(FileOperateUtil.REALNAME, zipName(fileName));
			map.put(FileOperateUtil.STORENAME, zipName(storeName));
			map.put(FileOperateUtil.SIZE, new File(zipName).length());
			map.put(FileOperateUtil.SUFFIX, "zip");
			map.put(FileOperateUtil.CONTENTTYPE, "application/octet-stream");
			map.put(FileOperateUtil.CREATETIME, new Date());

			// 自定义参数值对
			for (String param : params) {
				map.put(param, values.get(param)[i]);
			}

			result.add(map);
		}
		return result;
	}

	/**
	 * 下载
	 * 
	 * @author geloin
	 * @date 2012-5-5 下午12:25:39
	 * @param request
	 * @param response
	 * @param storeName
	 * @param contentType
	 * @param realName
	 * @throws Exception
	 */
	public static void download(HttpServletRequest request,
			HttpServletResponse response, String storeName, String contentType,
			String realName) throws Exception {
		response.setContentType("text/html;charset=UTF-8"); // 设置相应类型和编码
		request.setCharacterEncoding("UTF-8");
		BufferedInputStream bis = null; // 从文件中读取内容
		BufferedOutputStream bos = null; // 向文件中写入内容
		// 先获得输入流，来读取网络服务器中的一个文件，然后用输出流写到本地的一个文件中
		String ctxPath = request.getSession().getServletContext()
				.getRealPath("/")
				+ FileOperateUtil.UPLOADDIR; // 获得服务器上存放下载资源的地址
		String downLoadPath = ctxPath + storeName; // 获得下载文件全路径
		// 获得文件大小
		long fileLength = new File(downLoadPath).length();

		response.setContentType(contentType);
		response.setHeader("Content-disposition", "attachment; filename="
				+ new String(realName.getBytes("utf-8"), "ISO8859-1"));
		System.out.println(new String(realName.getBytes("utf-8"), "ISO-8859-1"));
		response.setHeader("Content-Length", String.valueOf(fileLength));
		// 输入流是将资源数据读入到缓冲Buffer中
		bis = new BufferedInputStream(new FileInputStream(downLoadPath));
		// 输出流是将缓冲Buffer中的数据按照指定格式写出到一个指定的位置
		bos = new BufferedOutputStream(response.getOutputStream());
		// 定义文件读取缓冲区
		byte[] buff = new byte[2048];
		int bytesRead;
		// 把下载资源写入到输出流
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
	}
}
