package dxol.util;

/**
 * datatable ajax请求参数
 * 
 * @author zyk
 * 
 */
public class DatatableParam {

	/**
	 * 记录操作次数，每次加1
	 */
	private String sEcho;
	/**
	 * 搜索的关键字
	 */
	private String sSearch;
	/**
	 * 每次显示数量
	 */
	private int iDisplayLength;
	/**
	 * 显示起始位置
	 */
	private int iDisplayStart;
	/**
	 * 列数
	 */
	private int iColumns;
	/**
	 * 拍序列的数量
	 */
	private int iSortingCols;
	/**
	 * 被排序的列
	 */
	private int iSortCol_0;
	/**
	 * 排序方向，"desc"/"asc"
	 */
	private String sSortDir_0;

	public String getsSortDir_0() {
		return sSortDir_0;
	}

	public void setsSortDir_0(String sSortDir_0) {
		this.sSortDir_0 = sSortDir_0;
	}

	public String getsEcho() {
		return sEcho;
	}

	public void setsEcho(String sEcho) {
		this.sEcho = sEcho;
	}

	public String getsSearch() {
		return sSearch;
	}

	public void setsSearch(String sSearch) {
		this.sSearch = sSearch;
	}

	public int getiDisplayLength() {
		return iDisplayLength;
	}

	public void setiDisplayLength(int iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	}

	public int getiDisplayStart() {
		return iDisplayStart;
	}

	public void setiDisplayStart(int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}

	public int getiColumns() {
		return iColumns;
	}

	public void setiColumns(int iColumns) {
		this.iColumns = iColumns;
	}

	public int getiSortingCols() {
		return iSortingCols;
	}

	public void setiSortingCols(int iSortingCols) {
		this.iSortingCols = iSortingCols;
	}

	public int getiSortCol_0() {
		return iSortCol_0;
	}

	public void setiSortCol_0(int iSortCol) {
		this.iSortCol_0 = iSortCol;
	}

}
