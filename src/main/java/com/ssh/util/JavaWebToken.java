package com.ssh.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import org.apache.log4j.Logger;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import sun.misc.BASE64Decoder;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.security.Key;
import java.util.Date;
import java.util.Map;

/**
 * Created by 幻夜~星辰 on 2018/12/20.
 */
public class JavaWebToken {
//    /**
//     * 创建 jwt
//     * @param id
//     * @param subject
//     * @param ttlMillis
//     * @return
//     * @throws Exception
//     */
//    public String createJWT(String id, String subject, long ttlMillis) throws Exception {
//        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256 ;
//        long nowMillis = System. currentTimeMillis();
//        Date now = new Date( nowMillis);
//        SecretKey key = generalKey();
//        JwtBuilder builder = Jwts. builder()
//                .setId(id)
//                .setIssuedAt(now)
//                .setSubject(subject)
//                .signWith(signatureAlgorithm, key);
//        if (ttlMillis >= 0){
//            long expMillis = nowMillis + ttlMillis;
//            Date exp = new Date( expMillis);
//            builder.setExpiration( exp);
//        }
//        return builder.compact();
//    }
//
//    /**
//     * 解密 jwt
//     * @param jwt
//     * @return
//     * @throws Exception
//     */
//    public Claims parseJWT(String jwt) throws Exception{
//        SecretKey key = generalKey();
//        Claims claims = Jwts. parser()
//                .setSigningKey( key)
//                .parseClaimsJws( jwt).getBody();
//        return claims;
//    }

//    private String createJWT(String id, String issuer, String subject, long ttlMillis) {
//
////The JWT signature algorithm we will be using to sign the token
//        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
//
//        long nowMillis = System.currentTimeMillis();
//        Date now = new Date(nowMillis);
//
////We will sign our JWT with our ApiKey secret
//        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(apiKey.getSecret());
//        Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());
//
//        //Let's set the JWT Claims
//        JwtBuilder builder = Jwts.builder().setId(id)
//                .setIssuedAt(now)
//                .setSubject(subject)
//                .setIssuer(issuer)
//                .signWith(signatureAlgorithm, signingKey);
//
////if it has been specified, let's add the expiration
//        if (ttlMillis >= 0) {
//            long expMillis = nowMillis + ttlMillis;
//            Date exp = new Date(expMillis);
//            builder.setExpiration(exp);
//        }
//
////Builds the JWT and serializes it to a compact, URL-safe string
//        return builder.compact();
//
//    }


    private static final String profiles="hxhxhxhxh";

    /**
     * 由字符串生成加密key
     * @return
     */
    private static SecretKey generalKey() throws IOException {
        String stringKey = profiles;
        byte[] encodedKey = (new BASE64Decoder()).decodeBuffer(stringKey);
        SecretKey key = new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");
        return key;
    }

    /**
     * 创建jwt
     * @param id
     * @param subject
     * @param ttlMillis
     * @return
     * @throws Exception
     */
    public static String createJWT(String id, String subject, long ttlMillis) throws Exception {
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        SecretKey key = generalKey();
        JwtBuilder builder = Jwts.builder()
                .setId(id)
                .setIssuedAt(now)
                .setSubject(subject)
                .signWith(signatureAlgorithm, key);
        if (ttlMillis >= 0) {
            long expMillis = nowMillis + ttlMillis;
            Date exp = new Date(expMillis);
            builder.setExpiration(exp);
        }
        return builder.compact();
    }

    /**
     * 解析jwt
     * @param jwt
     * @return
     * @throws Exception
     */
    public static Claims parseJWT(String jwt) throws Exception{
        SecretKey key = generalKey();
        Claims claims = Jwts.parser()
                .setSigningKey(key)
                .parseClaimsJws(jwt).getBody();

        return claims;
    }

}
