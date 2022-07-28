<?php

namespace App\Imports;

use App\Models\Suppression;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;

class SuppressionImport implements ToModel, WithHeadingRow, WithBatchInserts
{
    private $group;

    private $batchSize = 1000;

    public function __construct($group)
    {
        $this->group = $group;
    }

    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Suppression([
            'phone' => $row['phone'],
            'group' => $this->group,
        ]);
    }
    
    /**
     * batchSize
     *
     * @return int
     */
    public function batchSize(): int
    {
        return $this->batchSize;
    }
}
