package com.icoolkj.common.utils.resolver;

import org.springframework.util.PropertyPlaceholderHelper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ParamsResolverHelper {
    private static String placeholderPrefix = "${";
    private static String placeholderSuffix = "}";
    private static PropertyPlaceholderHelper helper =
            new PropertyPlaceholderHelper(placeholderPrefix, placeholderSuffix);

    public static String resolveParams(final Map<String, Object> param, String con) {
        con = helper.replacePlaceholders(con, (key -> param.get(key) + ""));
        return con;
    }

    private static Pattern key = Pattern.compile("\\$\\{(.*?)\\}");

    public static List<String> findParamKeys(String con) {
        Matcher m = key.matcher(con);
        List ret = new ArrayList();
        while (m.find()) {
            ret.add(m.group(1));
        }
        return ret;
    }

}
