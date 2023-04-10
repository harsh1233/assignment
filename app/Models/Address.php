<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = 'address';
    protected $primaryKey = 'id';
    
    protected $fillable = [
        'name',
        'street1',
        'street2',
        'street3',
        'city',
        'postcode',
        'state_id',
    ];

    public function state()
    {
        return $this->belongsTo(State::class);
    }

    public function person_addresses()
    {
        return $this->hasMany(PersonAddress::class);
    }
}
