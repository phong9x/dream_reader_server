package org.dream_reader.common.mail;

import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

public class Mail {

    private MailSender mailSender;
    private SimpleMailMessage simpleMailMessage;

    public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
        this.simpleMailMessage = simpleMailMessage;
    }

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Autowired
    public void sending(String to, String subject) {
        try {
            System.setProperty("mail.mime.charset", "utf8");
            SimpleMailMessage message = new SimpleMailMessage(simpleMailMessage);
            message.setTo(to);
            message.setText(String.format(simpleMailMessage.getText(), subject));
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }


    }

    public static boolean sendEmail(String toEmail, String content) {
        try {
            if (toEmail != null) {
                ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Mail.xml");
                JavaMailSenderImpl sender = (JavaMailSenderImpl) context.getBean("mailSender");
                System.out.println(sender.getUsername() + "|" + sender.getPassword() + "|" + sender.getHost());
                Mail mm = (Mail) context.getBean("mail");
                mm.sending(toEmail, content);
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return false;
    }




}
