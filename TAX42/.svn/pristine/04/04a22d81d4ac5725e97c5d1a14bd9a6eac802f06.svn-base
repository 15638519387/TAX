package com.soft.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


/**
 * 进行导入 导出
 * @author admin
 *
 */
public class ExcelUtil {

     	private static final String XLS = ".xls";
     	private static final String XLSX = ".xlsx";
     	
     	/**
     	 * 导出
     	 * @param suffix  Excel .xls .xlsx
     	 * @param sheetname  命名
     	 * @param dataList   数据
     	 * @return
     	 */
     	public static  Workbook createExcel(String suffix , String sheetname , List<Map<String , Object>> dataList) {
     		try {
				//判断参数是否为空
				if(suffix == null || "".equals(suffix)
						||sheetname == null || "".equals(sheetname)
						||dataList.size()== 0) {
					return null ;
				}
				
				//创建workbook对象
				Workbook book = null ;
				if(XLS.equals(suffix)) {
					book = new HSSFWorkbook();
				}else if(XLSX.equals(suffix)) {
					book = new XSSFWorkbook();
				}
				
				//创建sheet
				Sheet sheet= book.createSheet(sheetname);
				
				//行下标
				int r = 0 ;
				
				//开始遍历数据并创建标题
				for(int i = 0 ; i < dataList.size();) {
					//创建行
					Row row = sheet.createRow(r);
					//每一条数据
					Map<String , Object> map = dataList.get(i);
					
					//所有标题
					Set<String> keySet = map.keySet();
					//循环创建单元格
					int j = 0 ;
					for(String titlr : keySet) {
						//创建单元格
						Cell cell =row.createCell(j++);
						if(r == 0) {
							cell.setCellValue(titlr);
						}else {
							cell.setCellValue(map.get(titlr)+"");
						}
					}
					if(r > 0) {
						i++ ;
					}
					r++ ;
				}
				return book;
			} catch (Exception e) {
				e.printStackTrace();
				return null ;
			}
     	}
     	
     	/**
     	 * 导入
     	 * @param suffix  Excel .xls .xlsx
     	 * @param input  InputStream 
     	 * @return
     	 */
     	public static List<Map<String , Object>> redExcel(String suffix , InputStream input){
     		try {
     			//判断参数是否为空
				if(suffix == null || "".equals(suffix)
						||input== null) {
					return null ;
				}
				
				//创建workbook对象
				Workbook book = null ;
				if(XLS.equals(suffix)) {
					book = new HSSFWorkbook(input);
				}else if(XLSX.equals(suffix)) {
					book = new XSSFWorkbook(input);
				}
				//获得sheet
				Sheet sheet = book.getSheetAt(0);
				
				//获得最大行数
				int rowNum = sheet.getLastRowNum();
				//定义封装的结果集
				List<Map<String , Object>> list = new ArrayList<>();
				
				//标题数组
				String[] titles = null ;
				
				//获得行
				for(int i = 0 ; i <= rowNum ; i++) {
					//行对象
					Row row = sheet.getRow(i);
					
					//每一条数据的集合
					Map<String , Object> map = new HashMap<>();
					
					//获得最后一个单元格的下标
					int cellNum = row.getLastCellNum();
					for(int j = 0 ; j <cellNum ; j++ ) {
						//单元格对象
						Cell cell = row.getCell(j);
						//单元格
						String val = cell.getStringCellValue();
						//标题行
						if(i == 0) {
							//创建标题数组
							if(titles==null) {
								titles = new String [cellNum];
							}
							titles[j] = val ;
						}else {
							//封装数据
							map.put(titles[j], val);
						}
					}
					//因为第一次循环是标题，map没有值
					if(i == 0) {
						continue;
					}
					list.add(map);
				}
				return list;
			} catch (Exception e) {
				e.printStackTrace();
				return null ;
			}
     	}
}
