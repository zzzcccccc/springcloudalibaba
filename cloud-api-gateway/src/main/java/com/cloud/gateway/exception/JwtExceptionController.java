//package com.cloud.gateway.exception;
//
//import org.springframework.web.bind.annotation.RestController;
//
//import com.hongseng.app.config.exception.RefreshTokenException;
//import io.jsonwebtoken.ExpiredJwtException;
//import io.jsonwebtoken.security.SignatureException;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import javax.servlet.http.HttpServletRequest;
//
//
///**
// * 处理filter异常抛出不到前端的问题
// */
//@RestController
//public class JwtExceptionController {
//
//    /**
//     * 重新抛出异常
//     */
//    @RequestMapping("/expiredJwtException")
//    public void expiredJwtException(HttpServletRequest request) throws ExpiredJwtException, RefreshTokenException {
//        if (request.getAttribute("expiredJwtException") instanceof ExpiredJwtException) {
//            throw ((ExpiredJwtException) request.getAttribute("expiredJwtException"));
//        } else {
//            throw new RefreshTokenException();
//        }
//    }
//
//    @RequestMapping("/signatureException")
//    public void signatureException(HttpServletRequest request) throws SignatureException {
//        throw ((SignatureException) request.getAttribute("signatureException"));
//    }
//
//
//}
//
