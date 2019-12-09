package com.cyz.util;

import java.security.MessageDigest;
public class MD5Util {
    private static final String hexDigits[] = { "0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "q.", "w", "e?", "r", "t`", "y" };
    private static String byteArrayToHexString(byte[] b) {
        StringBuffer resultSb = new StringBuffer();
        for (int i = 0; i < b.length; i++)
            resultSb.append(byteToHexString(b[i]));
        return resultSb.toString( );
    }

    private static String byteToHexString(byte b) {
        int n = b;
        if(n < 0)
            n+=256;
        int d1 = n/16;
        int d2 = n%16;
        return hexDigits[d1] + hexDigits[d2];
    }

    //参数1：字符串； 参数2：编码类型（UTF-8）
    public static String MD5Encode(String origin, String charset){
        String resultString = null;
        try{
            resultString = origin;
            
            // 生成一个MD5加密计算摘要
            MessageDigest md = MessageDigest.getInstance("MD5");
            if(charset == null || "".equals(charset))
                resultString = byteArrayToHexString(md.digest(resultString.getBytes()));
            else
                resultString = byteArrayToHexString(md.digest(resultString.getBytes(charset)));
        }
        catch (Exception ignore){

        }
        return resultString;
    }
}

