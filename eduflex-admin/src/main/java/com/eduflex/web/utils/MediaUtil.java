package com.eduflex.web.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * 媒体文件工具类
 */
public class MediaUtil {

    public static Integer getMediaDuration(String filePath) {
        try {
            // 构建 FFmpeg 命令来获取媒体文件的时长
            String command = "ffmpeg -i " + filePath;
            Process process = Runtime.getRuntime().exec(command);

            // 读取 FFmpeg 的输出流
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.contains("Duration")) {
                    String durationLine = line.split(",")[0].trim();
                    // 获取持续时间并解析
                    String duration = durationLine.replace("Duration: ", "");
                    return parseDuration(duration);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    private static Integer parseDuration(String duration) {
        String[] timeParts = duration.split(":");
        int hours = Integer.parseInt(timeParts[0]);
        int minutes = Integer.parseInt(timeParts[1]);
        String[] secondsParts = timeParts[2].split("\\.");
        int seconds = Integer.parseInt(secondsParts[0]);
        int milliseconds = Integer.parseInt(timeParts[1]);

        return hours * 3600 + minutes * 60 + seconds + milliseconds / 1000;
    }
}
