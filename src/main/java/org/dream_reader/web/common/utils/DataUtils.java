package org.dream_reader.web.common.utils;

import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import javax.servlet.http.Cookie;

import org.apache.commons.lang.RandomStringUtils;


public class DataUtils {
	
    public static void main(String[] args) {
    	int point  = Integer.parseInt(String.valueOf("꿈교환권 1장").replace("꿈교환권 ", "").replace("장", ""));
		System.out.println(point);
    }

	public enum FormatDate {
        YYYYMMDD("yyyy/MM/dd"), YYYYMM("yyyy/MM"), YYYYMMDDHHMMSS("yyyy/MM/dd HH:mm:ss");

        String pattern;

        FormatDate(String pattern) {
            this.pattern = pattern;
        }

        public String getPattern() {
            return pattern;
        }
    }
    
	public static int randInt(int min, int max) {

        // Usually this can be a field rather than a method variable
        Random rand = new Random();

        // nextInt is normally exclusive of the top value,
        // so add 1 to make it inclusive
        int randomNum = rand.nextInt((max - min) + 1) + min;

        return randomNum;
    }
	
    public static Integer roundInteger(double number, int numberOfRound) {
        double round = Math.pow(10, numberOfRound);
        Double result = (Math.ceil(number / round)*round);
        Integer intValue = result.intValue();
        return intValue;
    }
    
    
    public static long getDaysBetween(Calendar startDate, Calendar endDate) {
        long end = endDate.getTimeInMillis();
        long start = startDate.getTimeInMillis();
        return TimeUnit.MILLISECONDS.toDays(Math.abs(end - start));
    }
    
    public enum DatePattern {
        YYYYMMDD("yyyy/MM/dd"), YYYYMM("yyyy/MM"), YYYYMMDDHHMMSS("yyyy/MM/dd HH:mm:ss");

        String pattern;

        DatePattern(String pattern) {
            this.pattern = pattern;
        }

        public String getPattern() {
            return pattern;
        }
    }

	public static Date parseDate(String dateStr, String formatDate ) {
        DateFormat df = new SimpleDateFormat(formatDate);
        Date startDate;
        try {
            startDate = df.parse(dateStr);
            return startDate;
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return null;
    }
    
    public static Integer parseInt(Object obj) {
        try {
            return Integer.parseInt(obj.toString());
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return 0;
    }

    public static Long parseLong(Object obj) {
        try {
            return Long.parseLong(obj.toString());
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return (long) 0;
    }

    
    public static Cookie createCookie(String cookieName, String cookieValue) {
        Cookie cookie = new Cookie(cookieName, cookieValue);
        final int expiryTime = 60 * 60 * 24;  // 24h in seconds
        cookie.setPath("/");
        cookie.setMaxAge(expiryTime);
        cookie.setSecure(true);
        return cookie;
    }

    public static String formatPhoneNumber(String str) {
        String temp = "";
        Integer a = (Integer) str.length() / 4;
        Integer b = str.length() - (a) * 4;
        int index = 0;
        for (int i = a; i >= 0; i--) {
            if (i == a) {
                temp = str.substring(str.length() - (index * 4 + 4), str.length() - index * 4) + temp;
            } else if (i == 0) {
                temp = str.substring(0, b) + "-" + temp;
            } else {
                temp = str.substring(str.length() - (index * 4 + 4), str.length() - index * 4) + "-" + temp;
            }
            index++;

        }

        return temp;
    }
    
    public static String parseStringFromDate(Date date, String formatDate) {
        try {
            DateFormat df = new SimpleDateFormat(formatDate);
            return df.format(date);
        } catch (Exception e) {
            return null;
        }

    }

	public static Integer getOffset(Integer page, Integer size) {
		int offset = 0;
		if (page > 1) {
			offset = ((page - 1) * size);
		}
		return offset;
	}

}
