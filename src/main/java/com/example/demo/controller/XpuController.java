package com.example.demo.controller;

import com.example.demo.dto.XpuDto;
import com.example.demo.service.XpuService;
import com.google.gson.Gson;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
public class XpuController {

    @Autowired
    private XpuService xpuService;

    @GetMapping("/test2")
    public String test2(Model model) throws Exception {
        List<XpuDto> list = xpuService.boardList();
        log.info("aaa"+list);
        model.addAttribute("list",list);
        return "test2";
    }


//    @GetMapping("/")
//    public String test(Model model) throws Exception {
//        List<XpuDto> list = xpuService.boardList();
//        log.info("aaa"+list);
//        model.addAttribute("list",list);
//        return "index";
//    }



//    @GetMapping("ajax.do")
//    @ResponseBody
//    public void ajax(HttpServletResponse response, @RequestParam String time, String type, int no, int per) throws Exception {
//        log.info("호출완");
//        Gson gson = new Gson();
//
//        Map<String, Object> data = new LinkedHashMap<>();
//
//        data.put("time", time);
//        data.put("type", type);
//        data.put("no", no);
//        data.put("per", per);
//        log.info(time+type+no+per);
////        log.info(name);
//        response.getWriter().print(gson.toJson(data));
//    }

//    @GetMapping("/test2/ajax.do")
//    @ResponseBody
//    public void ajax2(HttpServletResponse response, @RequestParam String time, String type, int no, int per) throws Exception {
//        log.info("호출완");
//        Gson gson = new Gson();
//
//        Map<String, Object> data = new LinkedHashMap<>();
//
//        data.put("time", time);
//        data.put("type", type);
//        data.put("no", no);
//        data.put("per", per);
//        log.info(time+type+no+per);
////        log.info(name);
//        response.getWriter().print(gson.toJson(data));
//    }



    @RequestMapping(value = "/getXpu")
    @ResponseBody
    public List<XpuDto> getXpu() throws Exception {
        List<XpuDto> list = xpuService.boardList();

        return list;
    }

    @GetMapping("/test3")
    public String test3() {
        return "test3";
    }
}
