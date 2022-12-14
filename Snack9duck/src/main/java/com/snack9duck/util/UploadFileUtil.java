package com.snack9duck.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtil {

	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
			throws Exception {
		String newFileName = fileName;
		 String imgPath = uploadPath + ymdPath;
		 File target = new File(imgPath, newFileName);
		 FileCopyUtils.copy(fileData, target);
		 File image = new File(imgPath + File.separator + newFileName);
		return newFileName;
	}

	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);

		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
}
