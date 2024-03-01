package com.icoolkj.web.controller.file;

import cn.hutool.core.codec.Base64;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.security.keys.RsaKeyPairHolder;
import com.icoolkj.file.domain.FileDetail;
import com.icoolkj.file.service.IFileDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RequestCallback;
import org.springframework.web.client.RestTemplate;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;

/**
 * 文件配置Controller
 *
 * @author icoolkj
 * @date 2023-10-05
 */
@RestController
@RequestMapping("/file/online")
public class OnlinePreviewController extends BaseController {

    @Autowired
    private IFileDetailService fileDetailService;


    @PostMapping( "/preview")
    public void onlinePreview(String encryptFileId, HttpServletResponse response) {
        InputStream inputStream =  null;
        OutputStream outputStream = null;
        String  fileId = RsaKeyPairHolder.decryptByPrivateKey(encryptFileId);
        FileDetail fileDetail = fileDetailService.selectFileDetailByFileDetailId(fileId);
        if (fileDetail == null ){
            //throw new FileNotFoundException("尚未查询到文件。");
        }
        String fileUrl = fileDetail.getUploadParentPath() + fileDetail.getUploadPath();
        File file = new File(fileUrl);
        if(!file.exists()){
            System.out.println(file.getPath());
            //throw new FileNotFoundException("尚未查询到文件");
        }
        response.reset();
        response.setCharacterEncoding(String.valueOf(StandardCharsets.UTF_8));
        response.setContentType(fileDetail.getUploadContentType());
        response.addHeader("Content-Disposition",
                "inline;filename=" + fileDetail.getUploadName());
    }


}
