package com.sstapp.service;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileStrorageService 
{
	
	// Service for uploading analysed report file
	
	public String upLoad(MultipartFile file) throws Exception
	{
		Path path = Paths.get("\tUpload......."+file.getOriginalFilename());
		Files.copy(file.getInputStream(),path,StandardCopyOption.REPLACE_EXISTING);
		
		
		return path.toString();
		
		
	}

}
