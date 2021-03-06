<?php defined('BASEPATH') OR exit('No direct script access allowed');

if ( ! function_exists('terbilang_eng'))
{
	function terbilang_eng($number) {
		
		$hyphen      = '-';
		$conjunction = ' and ';
		$separator   = ', ';
		$negative    = 'negative ';
		$decimal     = ' point ';
		$dictionary  = array(
			0                   => 'zero',
			1                   => 'one',
			2                   => 'two',
			3                   => 'three',
			4                   => 'four',
			5                   => 'five',
			6                   => 'six',
			7                   => 'seven',
			8                   => 'eight',
			9                   => 'nine',
			10                  => 'ten',
			11                  => 'eleven',
			12                  => 'twelve',
			13                  => 'thirteen',
			14                  => 'fourteen',
			15                  => 'fifteen',
			16                  => 'sixteen',
			17                  => 'seventeen',
			18                  => 'eighteen',
			19                  => 'nineteen',
			20                  => 'twenty',
			30                  => 'thirty',
			40                  => 'fourty',
			50                  => 'fifty',
			60                  => 'sixty',
			70                  => 'seventy',
			80                  => 'eighty',
			90                  => 'ninety',
			100                 => 'hundred',
			1000                => 'thousand',
			1000000             => 'million',
			1000000000          => 'billion',
			1000000000000       => 'trillion',
			1000000000000000    => 'quadrillion',
			1000000000000000000 => 'quintillion'
		);
		
		if (!is_numeric($number)) {
			return false;
		}
		
		if (($number >= 0 && (int) $number < 0) || (int) $number < 0 - PHP_INT_MAX) {
			// overflow
			trigger_error(
				'terbilang_eng only accepts numbers between -' . PHP_INT_MAX . ' and ' . PHP_INT_MAX,
				E_USER_WARNING
			);
			return false;
		}

		if ($number < 0) {
			return $negative . terbilang_eng(abs($number));
		}
		
		$string = $fraction = null;
		
		if (strpos($number, '.') !== false) {
		// if ( strpos($number, '.') !== false && empty(substr($number, -strpos($number, '.')+1)) ) {
			list($number, $fraction) = explode('.', $number);
		}
		
		switch (true) {
			case $number < 21:
				$string = $dictionary[$number];
				break;
			case $number < 100:
				$tens   = ((int) ($number / 10)) * 10;
				$units  = $number % 10;
				$string = $dictionary[$tens];
				if ($units) {
					$string .= $hyphen . $dictionary[$units];
				}
				break;
			case $number < 1000:
				$hundreds  = $number / 100;
				$remainder = $number % 100;
				$string = $dictionary[$hundreds] . ' ' . $dictionary[100];
				if ($remainder) {
					$string .= $conjunction . terbilang_eng($remainder);
				}
				break;
			default:
				$baseUnit = pow(1000, floor(log($number, 1000)));
				$numBaseUnits = (int) ($number / $baseUnit);
				$remainder = $number % $baseUnit;
				$string = terbilang_eng($numBaseUnits) . ' ' . $dictionary[$baseUnit];
				if ($remainder) {
					$string .= $remainder < 100 ? $conjunction : $separator;
					$string .= terbilang_eng($remainder);
				}
				break;
		}
		
		if (null !== $fraction && is_numeric($fraction) && !empty((int)$fraction)) {
			$string .= $decimal;
			$words = array();
			foreach (str_split((string) $fraction) as $number) {
				$words[] = $dictionary[$number];
			}
			$string .= implode(' ', $words);
		}
		
		return $string;
	}
}

// TERBILANG INDONESIAN & ENGLISH ===================
if ( ! function_exists('terbilang_ina'))
{
	function terbilang_ina($x)
	{
		$abil = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
		if ($x < 12)
			$result = " " . $abil[$x];
		elseif ($x < 20)
			$result = terbilang_ina($x - 10) . "belas";
		elseif ($x < 100)
			$result = terbilang_ina($x / 10) . " puluh" . terbilang_ina($x % 10);
		elseif ($x < 200)
			$result = " seratus" . terbilang_ina($x - 100);
		elseif ($x < 1000)
			$result = terbilang_ina($x / 100) . " ratus" . terbilang_ina($x % 100);
		elseif ($x < 2000)
			$result = " seribu" . terbilang_ina($x - 1000);
		elseif ($x < 1000000)
			$result = terbilang_ina($x / 1000) . " ribu" . terbilang_ina($x % 1000);
		elseif ($x < 1000000000)
			$result = terbilang_ina($x / 1000000) . " juta" . terbilang_ina($x % 1000000);
		elseif ($x < 1000000000000)
			$result = terbilang_ina($x / 1000000000) . " miliar" . terbilang_ina($x % 1000000000);
			
		return ucwords($result);
	}	
}

if ( ! function_exists('terbilang_ina2'))
{
	function terbilang_ina2($x)
	{
		$decimal = ' koma ';
		$fraction = null;
		if (strpos($x, '.') !== false) {
			list($x, $fraction) = explode('.', $x);
		}
		$result = terbilang_ina($x);
		
		if (null !== $fraction && is_numeric($fraction)) {
			$result .= $decimal.terbilang_ina($fraction);
		}
		
		return ucwords($result);
	}	
}

