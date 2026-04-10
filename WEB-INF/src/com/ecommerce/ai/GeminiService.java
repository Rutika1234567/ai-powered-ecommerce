package com.ecommerce.ai;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class GeminiService {

    private static final String API_KEY = "YOUR_GEMINI_API_KEY";

    public static String getResponse(String userMessage) {
        try {
            URL url = new URL("https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=" + API_KEY);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInput = "{\n" +
                    "  \"contents\": [{\n" +
                    "    \"parts\": [{\"text\": \"" + userMessage + "\"}]\n" +
                    "  }]\n" +
                    "}";

            OutputStream os = conn.getOutputStream();
            os.write(jsonInput.getBytes());
            os.flush();
            os.close();

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String output, response = "";
            while ((output = br.readLine()) != null) {
                response += output;
            }

            // simple extraction (basic parsing)
            int start = response.indexOf("text\":\"") + 7;
            int end = response.indexOf("\"", start);
            return response.substring(start, end);

        } catch (Exception e) {
            e.printStackTrace();
            return "Error from AI";
        }
    }
}