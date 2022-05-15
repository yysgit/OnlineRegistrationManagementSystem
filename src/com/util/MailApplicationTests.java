package com.util;



import java.util.Arrays;
import java.util.List;

public class MailApplicationTests {


    public static void  sendEmail(String to,String subject,String body ) throws Exception {
        //QQ邮箱测试
        String userName = "1095737364@qq.com"; // 发件人邮箱
        String password = "nlnogwzfdpaghjcd"; // 发件人密码，其实不一定是邮箱的登录密码，对于QQ邮箱来说是SMTP服务的授权文本
        String smtpHost = "smtp.qq.com"; // 邮件服务器

        //163邮箱测试
        // String userName = "gblfy02@163.com"; // 发件人邮箱
        // String password = "TBFJUSKCUOPEYOYU"; // 发件人密码，其实不一定是邮箱的登录密码，对于QQ邮箱来说是SMTP服务的授权文本
        // String smtpHost = "smtp.163.com"; // 邮件服务器

//        String to = "guo_bin@sinosoft.com.cn"; // 收件人，多个收件人以半角逗号分隔
//        String cc = "songzihao@sinosoft.com.cn"; // 抄送，多个抄送以半角逗号分隔
//        String subject = "这是邮件的主题 163"; // 主题
//        String body = "这是邮件的正文163"; // 正文，可以用html格式的哟
//        List<String> attachments = Arrays.asList("D:\\安装包\\【繁星课堂】DataX3.0离线同步课件.pdf", "D:\\安装包\\权限控制优化需求.docx"); // 附件的路径，多个附件也不怕

        EmailUtils emailUtils = EmailUtils.entity(smtpHost, userName, password, to, null, subject, body, null);

        emailUtils.send(); // 发送！
    }


    public static void main(String[] args) {
        try{
            MailApplicationTests.sendEmail("775082982@qq.com","测试邮件!","你好啊!");
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}

