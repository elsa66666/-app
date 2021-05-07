## 1 一些阴间问题的解决方法

### 1.1 第三方库安装不上

github显示形如：

```
unable to access 'https://github.com/xmartlabs/XLPagerTabStrip.git/': LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443 
```

解决方法：

```
git config --local http.sslBackend "openssl"
```





## 2 用到的第三方库

### 2.1 XLPagerTabStrip

https://github.com/elsa66666/XLPagerTabStrip/blob/master/Example/instagram.gif

