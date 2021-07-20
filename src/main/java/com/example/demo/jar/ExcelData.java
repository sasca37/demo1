package com.example.demo.jar;

import java.io.File;

import java.io.FileOutputStream;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.ResultSet;

import java.sql.Statement;

import java.text.SimpleDateFormat;



import org.apache.poi.ss.usermodel.Cell;

import org.apache.poi.ss.usermodel.Row;

import org.apache.poi.xssf.usermodel.XSSFSheet;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;



public class ExcelData {

    Connection con = null;

    Statement stmt = null;

    String url = "jdbc:mysql://localhost/Data?serverTimezone=Asia/Seoul&useSSL=false";

    String user = "root";

    String passwd = "nipa2021-1000";

    SimpleDateFormat cal = new SimpleDateFormat ("yyyy-MM-dd");

    String format_time = cal.format(System.currentTimeMillis());

    static String parsing = "";

    static String date = "";

    //  System.out.println(format_time);

    /**

     <!-- 엑셀 라이브러리 poi  -->

     <dependency>

     <groupId>org.apache.poi</groupId>

     <artifactId>poi</artifactId>

     <version>4.1.2</version>

     </dependency>



     <dependency>

     <groupId>org.apache.poi</groupId>

     <artifactId>poi-ooxml</artifactId>

     <version>4.1.2</version>

     </dependency>

     */

    public static void main(String[] args) {



        ExcelData db = new ExcelData();



        try

        {

            //데이터베이스 연결

            Class.forName("com.mysql.cj.jdbc.Driver");

            db.con = DriverManager.getConnection(db.url, db.user, db.passwd);

            db.stmt = db.con.createStatement();

            System.out.println("Success DB Connection!");

            db.selectData();

            System.out.println("======================");



        } catch(Exception e) {

            System.out.println(e.toString());

        } finally {

            try {

                db.stmt.close();

                db.con.close();

            } catch(Exception e) {

                System.out.println(e.toString());

            }

        }

    }

    void selectData() {

        try {

            String selectStr = "SELECT * FROM xpudata";

            ResultSet rs = stmt.executeQuery(selectStr);



            //엑셀 workbook 생성

            XSSFWorkbook workbook = new XSSFWorkbook();

            if(rs.next()) {

                date = rs.getString("time");

                parsing = date.substring(0,13);

                //System.out.println("pasing"+parsing);

            }





            //엑셀 sheet 생성

            XSSFSheet sheet = workbook.createSheet(parsing);

            sheet.setColumnWidth(0, 7000);

            //Row 생성

            Row row = sheet.createRow(0);

            //Cell 생성

            Cell cell = row.createCell(0);

            cell.setCellValue("time");

            cell = row.createCell(1);

            cell.setCellValue("type");

            cell = row.createCell(2);

            cell.setCellValue("no");

            cell = row.createCell(3);

            cell.setCellValue("per");



            int cellnum = 1;

            while(rs.next()) {







                date = rs.getString("time");

                String parsing_2 = date.substring(0,13);

                if(!parsing.equals(parsing_2)) {

                    System.out.println("success date: "+parsing_2);



                    parsing = parsing_2;



                    sheet = workbook.createSheet(parsing);

                    sheet.setColumnWidth(0, 7000);

                    row = sheet.createRow(0);

                    //Cell 생성

                    cell = row.createCell(0);

                    cell.setCellValue("time");

                    cell = row.createCell(1);

                    cell.setCellValue("type");

                    cell = row.createCell(2);

                    cell.setCellValue("no");

                    cell = row.createCell(3);

                    cell.setCellValue("per");

                    cellnum=1;

                    continue;

                }

                row = sheet.createRow(cellnum);



                cell = row.createCell(0);

                cell.setCellValue(rs.getString("time"));

                cell = row.createCell(1);

                cell.setCellValue(rs.getString("type"));

                cell = row.createCell(2);

                cell.setCellValue(rs.getString("no"));

                cell = row.createCell(3);

                cell.setCellValue(rs.getString("per"));

                cellnum +=1;



            }



            try(FileOutputStream out = new FileOutputStream(new File("data.xlsx"))) {

                workbook.write(out);

                System.out.println("엑셀파일이 저장되었습니다.");

            }catch (Exception e)

            {

                e.printStackTrace();

            }

        } catch(Exception e) {

            System.out.println("셀렉트 실패 이유 : " + e.toString());

        }

    }

}
