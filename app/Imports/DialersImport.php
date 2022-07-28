<?php

namespace App\Imports;

use App\Models\Dialer;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class DialersImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Dialer([
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
        ]);
    }
}