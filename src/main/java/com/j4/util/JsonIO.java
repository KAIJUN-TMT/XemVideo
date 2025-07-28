package com.j4.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JsonIO {
	public static String read(HttpServletRequest request) throws IOException {
		StringBuilder builder = new StringBuilder();
		BufferedReader reader = request.getReader();
		String line;
		while ((line=reader.readLine()) != null) {
			builder.append(line);
		}
		return builder.toString();
	}
	
	public static void write(HttpServletResponse response, String json) throws IOException {
		response.setContentType("application/json");
		PrintWriter writer = response.getWriter();
		writer.print(json);
		writer.flush();
	}
}
