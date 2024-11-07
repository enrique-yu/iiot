package com.icoolkj.file.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.github.tobato.fastdfs.domain.fdfs.DefaultThumbImageConfig;
import com.github.tobato.fastdfs.domain.fdfs.MetaData;
import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.domain.upload.FastFile;
import com.github.tobato.fastdfs.domain.upload.FastImageFile;
import com.github.tobato.fastdfs.service.DefaultFastFileStorageClient;
import com.icoolkj.common.config.FastDFSConfig;
import com.icoolkj.common.exception.file.FileUploadException;
import com.icoolkj.file.domain.StorePathExtended;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Set;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description FastDFSService FastDFS文件上传服务
 * @createDate 2023/09/09
 */
@Service
public class FastDFSService
{
    private static final Logger logger = LoggerFactory.getLogger(FastDFSService.class);

    @Autowired
    private DefaultFastFileStorageClient fastFileStorageClient;

    @Autowired
    private FastDFSConfig fastDFSConfig;

    @Autowired
    private DefaultThumbImageConfig defaultThumbImageConfig;

    public StorePathExtended uploadFile(MultipartFile file, Set<MetaData> metaDataSet) {
        try (InputStream inputStream = file.getInputStream()) {
            FastFile.Builder builder = createFileBuilder(inputStream, file.getSize(), file.getOriginalFilename(), metaDataSet);
            return uploadFile(builder);
        } catch (IOException e) {
            handleUploadException(e, "文件上传异常");
            return null;
        }
    }

    public StorePathExtended uploadImageWithThumbnail(MultipartFile imageFile, Set<MetaData> metaDataSet) {
        try (InputStream inputStream = imageFile.getInputStream()) {
            FastImageFile.Builder builder = createImageFileBuilder(inputStream, imageFile.getSize(), imageFile.getOriginalFilename(), metaDataSet);
            return uploadFile(builder);
        } catch (IOException e) {
            handleUploadException(e, "文件上传异常（缩略图）");
            return null;
        }
    }

    private StorePathExtended uploadFile(FastFile.Builder builder) {
        StorePath storePath = fastFileStorageClient.uploadFile(builder.build());
        return new StorePathExtended(storePath);
    }

    private StorePathExtended uploadFile(FastImageFile.Builder builder) {
        StorePath storePath = fastFileStorageClient.uploadImage(builder.build());
        return new StorePathExtended(storePath, getThumbnailUrl(storePath));
    }

    private FastFile.Builder createFileBuilder(InputStream inputStream, long fileSize, String originalFilename, Set<MetaData> metaDataSet) {
        FastFile.Builder builder = new FastFile.Builder()
                .withFile(inputStream, fileSize, FilenameUtils.getExtension(originalFilename))
                .toGroup(fastDFSConfig.getGroupName());

        if (metaDataSet != null) {
            builder.withMetaData(metaDataSet);
        }

        return builder;
    }

    private FastImageFile.Builder createImageFileBuilder(InputStream inputStream, long fileSize, String originalFilename, Set<MetaData> metaDataSet) {
        FastImageFile.Builder builder = new FastImageFile.Builder()
                .withFile(inputStream, fileSize, FilenameUtils.getExtension(originalFilename))
                .withThumbImage()
                .toGroup(fastDFSConfig.getGroupName());

        if (metaDataSet != null) {
            builder.withMetaData(metaDataSet);
        }

        return builder;
    }

    private void handleUploadException(Exception e, String errorMessage) {
        logger.error(errorMessage, e);
        throw new FileUploadException(errorMessage);
    }

    public String getThumbnailUrl(StorePath storePath) {
        // 构建文件访问地址
        StringBuilder urlBuilder = new StringBuilder();
        // 原始文件路径
        String originalFilePath = storePath.getFullPath();
        String parentPath = originalFilePath.substring(0, originalFilePath.lastIndexOf("/") + 1);
        // 获取原始文件名和扩展名
        String originalFileName = originalFilePath.substring(originalFilePath.lastIndexOf("/") + 1);
        int dotIndex = originalFileName.lastIndexOf(".");
        if (dotIndex != -1) {
            String nameWithoutExtension = originalFileName.substring(0, dotIndex);
            String fileExtension = originalFileName.substring(dotIndex);
            urlBuilder.append(parentPath).append(nameWithoutExtension).append(defaultThumbImageConfig.getPrefixName()).append(fileExtension);
        } else {
            urlBuilder.append(parentPath).append(originalFileName).append(defaultThumbImageConfig.getPrefixName()); // 没有文件扩展名的情况
        }
        return urlBuilder.toString();
    }

   public boolean isSupportImage(String fileType) {
        List<String> supportImageTypes = fastDFSConfig.getSupportImageTypes();
        if (CollectionUtil.isNotEmpty(supportImageTypes)){
           return supportImageTypes.contains(fileType);
        }
        return false;
    }

}

