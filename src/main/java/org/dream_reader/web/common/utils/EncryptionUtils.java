package org.dream_reader.web.common.utils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

/**
 * Created by kennphong on 5/20/2016.
 */
public class EncryptionUtils {

    public static final String JWT_KEY = "Dreamer";

    public static void main(String[] args) {
    	
    	System.out.println(jwtBuild("111"));
    	System.out.println(jwtParse("eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMTEifQ.Hucl6-0C6J--oxPqHftCpwBoJ4i-ICddX5MdpRq2XU4",String.class));
    }
    /**
     * Encrypt with jwt
     * @param subject
     * @return
     */
    public static String jwtBuild(Object subject) {
        return Jwts.builder()
                .setSubject(JsonUtils.toString(subject))
                .signWith(SignatureAlgorithm.HS256, JWT_KEY.getBytes())
                .compact();
    }

    /**
     * Decrypt with jwt
     * and convert to klass T
     * @param jwtToken
     * @param klass
     * @param <T>
     * @return
     */
    public static <T> T jwtParse(String jwtToken, Class<T> klass) {
        String parse = Jwts.parser()
                .setSigningKey(JWT_KEY.getBytes())
                .parseClaimsJws(jwtToken)
                .getBody()
                .getSubject();
        return JsonUtils.from(parse, klass);
    }

}