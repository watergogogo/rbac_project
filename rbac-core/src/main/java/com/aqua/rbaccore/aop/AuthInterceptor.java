package com.aqua.rbaccore.aop;

import com.aqua.rbaccore.annotation.AuthCheck;
import com.aqua.rbaccore.service.UserService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;

import javax.annotation.Resource;

/**
 * @author water king
 * @time 2024/2/6
 */
public class AuthInterceptor {

    @Resource
    private UserService userService;

    /**
     * 执行拦截
     *
     * @param joinPoint
     * @param authCheck
     * @return
     */
    @Around("@annotation(authCheck)")
    public Object doInterceptor(ProceedingJoinPoint joinPoint, AuthCheck authCheck) throws Throwable {
//        List<String> anyRole = Arrays.stream(authCheck.anyRole()).filter(StringUtils::isNotBlank).collect(Collectors.toList());
//        String mustRole = authCheck.mustRole();
//        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
//        HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
//        // 当前登录用户
//        User user = userService.getLoginUser(request);
//        // 拥有任意权限即通过
//        if (CollectionUtils.isNotEmpty(anyRole)) {
//            String userRole = user.getUserRolePermission();
//            if (!anyRole.contains(userRole)) {
//                throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
//            }
//        }
//        // 必须有所有权限才通过
//        if (StringUtils.isNotBlank(mustRole)) {
//            String userRole = user.getUserRolepermission();
//            if (!mustRole.equals(userRole)) {
//                throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
//            }
//        }
        // 通过权限校验，放行
        return joinPoint.proceed();
    }
}
