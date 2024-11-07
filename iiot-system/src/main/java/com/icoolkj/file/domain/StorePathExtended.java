package com.icoolkj.file.domain;

import com.github.tobato.fastdfs.domain.fdfs.StorePath;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description StorePathExtended
 * @createDate 2023/09/24
 */
public class StorePathExtended {

    private StorePath storePath;

    private String thumbImageFullPath;

    public StorePathExtended() {
    }

    public StorePathExtended(StorePath storePath) {
        this.storePath = storePath;
    }

    public StorePathExtended(StorePath storePath, String thumbImageFullPath) {
        this.storePath = storePath;
        this.thumbImageFullPath = thumbImageFullPath;
    }

    public StorePath getStorePath() {
        return storePath;
    }

    public void setStorePath(StorePath storePath) {
        this.storePath = storePath;
    }

    public String getThumbImageFullPath() {
        return thumbImageFullPath;
    }

    public void setThumbImageFullPath(String thumbImageFullPath) {
        this.thumbImageFullPath = thumbImageFullPath;
    }
}
