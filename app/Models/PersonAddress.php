<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PersonAddress extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = 'person_address';
    
    protected $fillable = [
        'person_id',
        'address_id',
        'active_from',
        'active_thru',
        'is_primary',
    ];

    public function person()
    {
        return $this->belongsTo(Person::class);
    }

    public function address()
    {
        return $this->belongsTo(Address::class);
    }
}
