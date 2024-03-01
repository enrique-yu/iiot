package com.icoolkj.iot;

import io.netty.handler.logging.LogLevel;

import java.time.Duration;

import static io.netty.handler.logging.LogLevel.DEBUG;

public class IotCoreProperties {

    /**
     * netty 打印的日志级别
     */
    private LogLevel level = DEBUG;

    /**
     * 工作组线程数量(等于0将由cpu的核数 * 2)
     */
    private short workerThreadNum = 0;

    /**
     * boss线程数量
     */
    private short bossThreadNum = 1;

    /**
     * Iot框架核心线程数
     */
    private short coreThreadNum = 1;

    /**
     * 线程任务执行器配置
     */
    private IotTaskExecutionProperties task = new IotTaskExecutionProperties();

    public static class IotTaskExecutionProperties {

        /**
         * 线程池线程数量
         */
        private int coreSize = 3;

        /**
         * Iot Executor Task
         */
        private String threadNamePrefix = "IET-";

        /**
         * Whether the executor should wait for scheduled tasks to complete on shutdown.
         */
        private boolean awaitTermination;

        /**
         * Maximum time the executor should wait for remaining tasks to complete.
         */
        private Duration awaitTerminationPeriod;

        public int getCoreSize() {
            return coreSize;
        }

        public void setCoreSize(int coreSize) {
            this.coreSize = coreSize;
        }

        public String getThreadNamePrefix() {
            return threadNamePrefix;
        }

        public void setThreadNamePrefix(String threadNamePrefix) {
            this.threadNamePrefix = threadNamePrefix;
        }

        public boolean isAwaitTermination() {
            return awaitTermination;
        }

        public void setAwaitTermination(boolean awaitTermination) {
            this.awaitTermination = awaitTermination;
        }

        public Duration getAwaitTerminationPeriod() {
            return awaitTerminationPeriod;
        }

        public void setAwaitTerminationPeriod(Duration awaitTerminationPeriod) {
            this.awaitTerminationPeriod = awaitTerminationPeriod;
        }
    }

    public LogLevel getLevel() {
        return level;
    }

    public IotCoreProperties setLevel(LogLevel level) {
        this.level = level;
        return this;
    }

    public short getWorkerThreadNum() {
        return workerThreadNum;
    }

    public IotCoreProperties setWorkerThreadNum(short workerThreadNum) {
        this.workerThreadNum = workerThreadNum;
        return this;
    }

    public short getCoreThreadNum() {
        return coreThreadNum;
    }

    public IotCoreProperties setCoreThreadNum(short coreThreadNum) {
        this.coreThreadNum = coreThreadNum;
        return this;
    }

    public IotTaskExecutionProperties getTask() {
        return task;
    }

    public void setTask(IotTaskExecutionProperties task) {
        this.task = task;
    }

    public short getBossThreadNum() {
        return bossThreadNum;
    }

    public void setBossThreadNum(short bossThreadNum) {
        this.bossThreadNum = bossThreadNum;
    }
}
