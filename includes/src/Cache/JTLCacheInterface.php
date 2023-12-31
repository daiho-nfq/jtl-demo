<?php declare(strict_types=1);

namespace JTL\Cache;

/**
 * Interface JTLCacheInterface
 * @package JTL\Cache
 */
interface JTLCacheInterface
{
    /**
     * @return array
     */
    public function getCachingGroups(): array;

    /**
     * @param array $options
     * @return JTLCacheInterface
     */
    public function setOptions(array $options = []): JTLCacheInterface;

    /**
     * set caching method by name
     *
     * @param string $methodName
     * @return bool
     */
    public function setCache(string $methodName): bool;

    /**
     * load shop cache config from db
     *
     * @param array $config
     * @return array
     */
    public function getJtlCacheConfig(array $config): array;

    /**
     * @param array $config
     * @return JTLCacheInterface
     */
    public function setJtlCacheConfig(array $config): JTLCacheInterface;

    /**
     * @return JTLCacheInterface
     */
    public function init(): JTLCacheInterface;

    /**
     * get current options
     *
     * @return array
     */
    public function getOptions(): array;

    /**
     * retrieve value from cache
     *
     * @param string|int    $cacheID
     * @param null|callable $callback
     * @param null|mixed    $customData
     * @return mixed
     */
    public function get($cacheID, ?callable $callback = null, $customData = null);

    /**
     * store value to cache
     *
     * @param string|int     $cacheID
     * @param mixed      $content
     * @param null|array|string $tags
     * @param null|int   $expiration
     * @return bool
     */
    public function set($cacheID, $content, $tags = null, ?int $expiration = null): bool;

    /**
     * store multiple values to multiple cache IDs at once
     *
     * @param array      $keyValue
     * @param array|null $tags
     * @param int|null   $expiration
     * @return bool
     */
    public function setMulti(array $keyValue, ?array $tags = null, ?int $expiration = null): bool;

    /**
     * get multiple values from cache
     *
     * @param array $cacheIDs
     * @return array
     */
    public function getMulti(array $cacheIDs): array;

    /**
     * check if cache for selected group id is active
     * this allows the disabling of certain cache types
     *
     * @param string|array $groupID
     * @return bool
     */
    public function isCacheGroupActive($groupID): bool;

    /**
     * @param array|string $tags
     * @return array
     */
    public function getKeysByTag($tags): array;

    /**
     * add cache tag to cache value by ID
     *
     * @param array|string $tags
     * @param string|int   $cacheID
     * @return bool
     */
    public function setCacheTag($tags, $cacheID): bool;

    /**
     * set custom cache lifetime
     *
     * @param int $lifetime
     * @return JTLCacheInterface
     */
    public function setCacheLifetime(int $lifetime): JTLCacheInterface;

    /**
     * set custom file cache directory
     *
     * @param string $dir
     * @return JTLCacheInterface
     */
    public function setCacheDir(string $dir): JTLCacheInterface;

    /**
     * get the currently activated cache method
     *
     * @return ICachingMethod
     */
    public function getActiveMethod(): ICachingMethod;

    /**
     * remove single ID from cache or group or remove whole group
     *
     * @param string|int|null   $cacheID
     * @param array|string|null $tags
     * @param array|null        $hookInfo
     * @return bool|int
     */
    public function flush($cacheID = null, $tags = null, $hookInfo = null);

    /**
     * delete keys tagged with one or more tags
     *
     * @param array|string $tags
     * @param mixed        $hookInfo
     * @return int
     */
    public function flushTags($tags, $hookInfo = null): int;

    /**
     * clear all values from cache
     *
     * @return bool
     */
    public function flushAll(): bool;

    /**
     * get result code from last operation
     *
     * @return int
     */
    public function getResultCode(): int;

    /**
     * get caching method's journal data
     *
     * @return array
     */
    public function getJournal(): array;

    /**
     * get statistical data
     *
     * @return array
     */
    public function getStats(): array;

    /**
     * test method's integrity
     *
     * @return bool
     */
    public function testMethod(): bool;

    /**
     * check if caching method is available
     *
     * @return bool
     */
    public function isAvailable(): bool;

    /**
     * check if caching is enabled
     *
     * @return bool
     */
    public function isActive(): bool;

    /**
     * get list of all installed caching methods
     *
     * @return array
     */
    public function getAllMethods(): array;

    /**
     * check which caching methods are available and usable
     *
     * @return array
     */
    public function checkAvailability(): array;

    /**
     * generate basic cache id with popular variables
     *
     * @param bool     $hash
     * @param bool|int $customerID
     * @param bool|int $customerGroup
     * @param bool|int $languageID
     * @param bool|int $currencyID
     * @param bool     $sslStatus
     * @return string
     */
    public function getBaseID(
        bool $hash = false,
        $customerID = false,
        $customerGroup = true,
        $languageID = true,
        $currencyID = true,
        bool $sslStatus = true
    ): string;

    /**
     * simple benchmark for different caching methods
     *
     * @param string|array $methods
     * @param string|mixed $testData
     * @param int          $runCount
     * @param int          $repeat
     * @param bool         $echo
     * @param bool         $format
     * @return array
     */
    public function benchmark(
        $methods = 'all',
        $testData = 'simple string',
        int $runCount = 1000,
        int $repeat = 1,
        bool $echo = true,
        bool $format = false
    ): array;

    /**
     * @return string
     */
    public function getError(): string;

    /**
     * @param string $error
     */
    public function setError(string $error): void;
}
