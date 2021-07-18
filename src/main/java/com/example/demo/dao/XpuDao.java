package com.example.demo.dao;

import com.example.demo.dto.XpuDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Mapper
public interface XpuDao {
    //List<xpuDto> counter(xpuDto param) throws Exception;
    List<XpuDto> boardList() throws Exception;
}
