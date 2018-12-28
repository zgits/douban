package com.ssh.util;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

//import static com.ssh.util.JavaWebToken.verifyJavaWebToken;

/**
 * Created by 幻夜~星辰 on 2018/12/20.
 */
public class AuthUtil {
//    private static Map<String, Object> getClientLoginInfo(HttpServletRequest request) throws Exception {
//        Map<String, Object> r = new HashMap<>();
//        String sessionId = request.getHeader("sessionId");
//        if (sessionId != null) {
//            r = decodeSession(sessionId);
//            return r;
//        }
//        throw new Exception("session解析错误");
//    }
//
//    public static Long getUserId(HttpServletRequest request) throws Exception {
//        return  Long.valueOf((Integer)getClientLoginInfo(request).get("userId"));
//
//    }
//
//    /**
//     * session解密
//     */
//    public static Map<String, Object> decodeSession(String sessionId) {
//        try {
//            return verifyJavaWebToken(sessionId);
//        } catch (Exception e) {
//            System.err.println("");
//            return null;
//        }
//    }
}


//    //登录
//    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST}, produces = "text/html;charset=UTF-8")
//    public String login(String account) {
//        User user = userService.login(account);
//
//        DTO dto = new DTO();
//        if (user == null) {
//            dto.code = "-1";
//            dto.msg = "Have not registered";
//        } else {
//            //把用户登录信息放进Session
//            Map<String, Object> loginInfo = new HashMap<>();
//            loginInfo.put("userId", user.getId());
//            String sessionId = JavaWebToken.createJavaWebToken(loginInfo);
//            System.out.println("sessionID"+sessionId);
//            dto.data = sessionId;
//        }
//        return JSON.toJSONString(dto);
//    }


//    修改昵称
//    @RequestMapping(value = "/updateName", method = {RequestMethod.GET, RequestMethod.POST})
//    public String updateName(HttpServletRequest request, String name) {
//        DTO dto = new DTO();
//        try {
//            //从session拿到token，再解密得到userid
//            Long userId = AuthUtil.getUserId(request);
//            boolean userIsExist = userService.updateName(userId, name);
//            if (userIsExist == false) {
//                dto.code = "-1";
//                dto.msg = "Have not updateAvatar";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return JSON.toJSONString(dto);
//    }