<?php

namespace App\Http\Controllers\Crm;

use Illuminate\Support\Facades\Config;
use DB;

/**
 * DatabaseConnectionController
 */
class DatabaseConnectionController
{
    /**
     * username
     *
     * @var mixed
     */
    private $username;

    /**
     * password
     *
     * @var mixed
     */
    private $password;

    /**
     * databasename
     *
     * @var mixed
     */
    private $databasename;

    /**
     * host
     *
     * @var mixed
     */
    private $host;

    /**
     * __construct
     *
     * @param  mixed $host
     * @param  mixed $username
     * @param  mixed $password
     * @param  mixed $databasename
     * @return void
     */
    public function __construct(String $host, String $username, String $password, String $databasename)
    {
        $this->setHost($host)
                ->setUsername($username)
                ->setPassword($password)
                ->setDatabasename($databasename);

        return $this;
    }


    /**
     * connect
     *
     * @return void
     */
    public function connect()
    {
        Config::set("database.connections.crm", [
            'driver' => 'mysql',
            "host" => $this->host,
            "database" => $this->databasename,
            "username" => $this->username,
            "password" => $this->password,
            "port" => '3306',
            'charset'   => 'utf8',
            'collation' => 'utf8_unicode_ci',
            'prefix'    => '',
            'strict'    => false,
        ]);

        return $this;
    }

    public function disconnect()
    {
        DB::disconnect('crm');
    }

    /**
     * Get host
     *
     * @return  mixed
     */
    public function getHost()
    {
        return $this->host;
    }

    /**
     * Set host
     *
     * @param  mixed  $host  host
     *
     * @return  self
     */
    public function setHost($host)
    {
        $this->host = $host;

        return $this;
    }

    /**
     * Get databasename
     *
     * @return  mixed
     */
    public function getDatabasename()
    {
        return $this->databasename;
    }

    /**
     * Set databasename
     *
     * @param  mixed  $databasename  databasename
     *
     * @return  self
     */
    public function setDatabasename($databasename)
    {
        $this->databasename = $databasename;

        return $this;
    }

    /**
     * Get password
     *
     * @return  mixed
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Set password
     *
     * @param  mixed  $password  password
     *
     * @return  self
     */
    public function setPassword($password)
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Get username
     *
     * @return  mixed
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set username
     *
     * @param  mixed  $username  username
     *
     * @return  self
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }
}
