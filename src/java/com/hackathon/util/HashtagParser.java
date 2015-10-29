/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hackathon.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Administrator
 */
public class HashtagParser {

    public static String parse(String tweetText) {

        // Search for URLs
        if (tweetText != null && tweetText.contains("http:")) {
            int indexOfHttp = tweetText.indexOf("http:");
            int endPoint = (tweetText.indexOf(' ', indexOfHttp) != -1) ? tweetText.indexOf(' ', indexOfHttp) : tweetText.length();
            String url = tweetText.substring(indexOfHttp, endPoint);
            String targetUrlHtml = "<a style=\"text-decoration:none; color:inherit;\" href='${url}' target='_blank'>${url}</a>";
            tweetText = tweetText.replace(url, targetUrlHtml);
        }

        String patternStr = "(?:\\s|\\A)[##]+([A-Za-z0-9-_]+)";
        Pattern pattern = Pattern.compile(patternStr);
        Matcher matcher = pattern.matcher(tweetText);
        String result = "";

        // Search for Hashtags
        while (matcher.find()) {
            result = matcher.group();
            //result = result.replace(" ", "");
            String search = result.replace("#", "");
            String searchHTML = "<a style=\"text-decoration:none; color:inherit;\" href='http://search.twitter.com/search?q=" + search + "'>" + result + "</a>";
            tweetText = tweetText.replace(result, searchHTML);
        }

        // Search for Users
        patternStr = "(?:\\s|\\A)[@]+([A-Za-z0-9-_]+)";
        pattern = Pattern.compile(patternStr);
        matcher = pattern.matcher(tweetText);
        while (matcher.find()) {
            result = matcher.group();
            result = result.replace(" ", "");
            String rawName = result.replace("@", "");
            String userHTML = "<a style=\"text-decoration:none; color:inherit;\" href='http://twitter.com/${rawName}'>" + result + "</a>";
            tweetText = tweetText.replace(result, userHTML);
        }
        return tweetText;
    }
}
