package com.paytm;

import java.util.HashMap;
import java.util.Map;

public class PaytmService {

    public static Map<String, String> getPaymentParams(String orderId, String amount) {

        Map<String, String> params = new HashMap<>();

        params.put("MID", PaytmConfig.MID);
        params.put("ORDER_ID", orderId);
        params.put("CUST_ID", "CUST001");

        //  IMPORTANT (format)
        params.put("TXN_AMOUNT", amount);

        params.put("CHANNEL_ID", PaytmConfig.CHANNEL_ID);
        params.put("WEBSITE", PaytmConfig.WEBSITE);
        params.put("INDUSTRY_TYPE_ID", PaytmConfig.INDUSTRY_TYPE_ID);
        params.put("CALLBACK_URL", PaytmConfig.CALLBACK_URL);

        //  REQUIRED
        params.put("EMAIL", "test@gmail.com");
        params.put("MOBILE_NO", "7777777777");

        return params;
    }
}