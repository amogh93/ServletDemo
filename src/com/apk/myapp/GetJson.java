package com.apk.myapp;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@WebServlet("/getCities")
public class GetJson extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public GetJson() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		List<Cities> cityList=new ArrayList<>();
		Cities c=new Cities(),c1=new Cities();
		c.setId(1);
		c.setName("Mumbai");
		c1.setId(2);
		c1.setName("Pune");
		cityList.add(c);
		cityList.add(c1);
		
		Type type=new TypeToken<ArrayList<Cities>>() {}.getType();
		Gson gson=new Gson();
		String cityJson=gson.toJson(cityList,type);
		
		response.setContentType("application/json");
		response.getWriter().write(cityJson);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
