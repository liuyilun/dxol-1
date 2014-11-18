package dxol.web.fileoperate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import dxol.service.student.StudentService;
import dxol.util.FileOperateUtil;

/**
 * 
 * @author liuwei
 * 
 */
@Controller
@RequestMapping(value = "background/fileOperate")
public class FileOperateController {
	@Autowired
	private StudentService studentService;
	
	/**
	 * 到上传文件的位置
	 * 
	 * @author liuwei
	 * @date 2012-3-29 下午4:01:31
	 * @return
	 */
	@RequestMapping(value = "")
	public/* ModelAndView */String toUpload() {
		// return new ModelAndView("background/fileOperate/upload");
		return "/fileOperate/upload";
	}

	/**
	 * 上传文件
	 * 
	 * @author liuwei
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public ModelAndView upload(HttpServletRequest request) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		// 别名
		String[] alaises = ServletRequestUtils.getStringParameters(request,
				"alais");
		System.out.println("!!!!!!!!!!!!");
		System.out.println(alaises);
		String[] params = new String[] { "alais" };
		Map<String, Object[]> values = new HashMap<String, Object[]>();
		values.put("alais", alaises);

		List<Map<String, Object>> result = FileOperateUtil.upload(request,
				params, values);

		map.put("result", result);

		return new ModelAndView("/fileOperate/list", map);
	}
}