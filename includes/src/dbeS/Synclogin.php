<?php declare(strict_types=1);

namespace JTL\dbeS;

use JTL\DB\DbInterface;
use JTL\Shop;
use Psr\Log\LoggerInterface;

/**
 * Class Synclogin
 * @package JTL\dbeS
 */
class Synclogin
{
    /**
     * @var string|null
     */
    public ?string $cMail = null;

    /**
     * @var string|null
     */
    public ?string $cName = null;

    /**
     * @var string|null
     */
    public ?string $cPass = null;

    /**
     * Synclogin constructor.
     * @param DbInterface     $db
     * @param LoggerInterface $logger
     */
    public function __construct(DbInterface $db, LoggerInterface $logger)
    {
        $obj = $db->select('tsynclogin', 'kSynclogin', 1);
        if ($obj !== null) {
            foreach (\array_keys(\get_object_vars($obj)) as $member) {
                $this->$member = $obj->$member;
            }
        } else {
            $logger->error('Kein Sync-Login gefunden.');
        }
    }

    /**
     * @param string $user
     * @param string $pass
     * @return bool
     * @throws \Exception
     */
    public function checkLogin(string $user, string $pass): bool
    {
        return $this->cName !== null
            && $this->cPass !== null
            && $this->cName === $user
            && Shop::Container()->getPasswordService()->verify($pass, $this->cPass) === true;
    }
}
