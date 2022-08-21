<?php

namespace App\Imports;

use App\Models\Dialer;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithUpserts;
use Illuminate\Contracts\Queue\ShouldQueue;

class DialersImport implements ToModel, WithHeadingRow, WithBatchInserts, WithChunkReading, ShouldQueue, WithUpserts
{
    /**
     * file
     *
     * @var mixed
     */
    public $file;

    /**
     * __construct
     *
     * @param  mixed $file
     * @return void
     */
    public function __construct($file)
    {
        $this->file = $file;
    }

    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Dialer(
            [
            'phone_number' => $row['phone'],
            'title' => $row['title'],
            'first_name' => $row['fname'],
            'last_name' => $row['lname'],
            'middle_name' => $row['fname'],
            'address1' => $row['houseno'],
            'address2' => $row['streetno'],
            'address3' => $row['landmarks'],
            'city' => $row['city'],
            'state' => $row['state'],
            'province' => $row['country'],
            'postal_code' => $row['zip'],
            'company' => $row['companyname'],
            'email' => $row['email'],
            'website' => $row['website'],
            'position' => $row['position'],
            'product_category' => $row['product_category'] ?? 'none',
            'file_name' => $this->file,
            ]
        );
    }

    /**
     * uniqueBy
     *
     * @return void
     */
    public function uniqueBy()
    {
        return 'phone_number';
    }

    /**
     * deleteExisting
     *
     * @param  mixed $phone
     * @return void
     */
    private function deleteExisting($phone): void
    {
        $dialer = Dialer::where('phone_number', $phone)->first();
        if ($dialer) {
            $dialer->delete();
        }
    }

    /**
     * batchSize
     *
     * @return int
     */
    public function batchSize(): int
    {
        return 1000;
    }

    /**
     * chunkSize
     *
     * @return int
     */
    public function chunkSize(): int
    {
        return 500;
    }
}
