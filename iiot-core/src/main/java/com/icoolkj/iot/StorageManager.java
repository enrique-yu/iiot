package com.icoolkj.iot;

/**
 * 存储管理
 */
public interface StorageManager<K, V> {

    V get(K key);

    V add(K key, V val);

    V remove(K key);

    boolean isExists(K key);

    Object getStorage();
}
