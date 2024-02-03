<?php defined('BASEPATH') or exit('No direct script access allowed');

class MX_Lang extends CI_Lang
{

	public function load($langfile, $idiom = '', $return = FALSE, $add_suffix = TRUE, $alt_path = '')
	{
			if (is_array($langfile))
			{
				foreach ($langfile as $value)
				{
					$this->load($value, $idiom, $return, $add_suffix, $alt_path);
				}

				return;
			}

			$langfile = str_replace('.php', '', $langfile);

			if ($add_suffix === TRUE)
			{
				$langfile = preg_replace('/_lang$/', '', $langfile).'_lang';
			}

			$langfile .= '.php';
			
			if (empty($idiom) OR ! preg_match('/^[a-z_-]+$/i', $idiom))
			{
				$idiom = 'english';
			}

			if ($return === FALSE && isset($this->is_loaded[$langfile]) && $this->is_loaded[$langfile] === $idiom)
			{
				return;
			}

			// Load the base file, so any others found can override it
			$basepath = APPPATH.'language/'.$idiom.'/'.$langfile;
			if (($found = file_exists($basepath)) === TRUE)
			{
				include($basepath);
			}

			// Do we have an alternative path to look in?
			if ($alt_path !== '')
			{
				$alt_path .= 'language/'.$idiom.'/'.$langfile;
				if (file_exists($alt_path))
				{
					include($alt_path);
					$found = TRUE;
				}
			}
			else
			{
				foreach (get_instance()->load->get_package_paths(TRUE) as $package_path)
				{
					$package_path .= 'language/'.$idiom.'/'.$langfile;
					if ($basepath !== $package_path && file_exists($package_path))
					{
						include($package_path);
						$found = TRUE;
						break;
					}
				}
			}

			if ($found !== TRUE)
			{
				show_error('Unable to load the requested language file: language/'.$idiom.'/'.$langfile);
			}

			if ( ! isset($lang) OR ! is_array($lang))
			{
				log_message('error', 'Language file contains no data: language/'.$idiom.'/'.$langfile);

				if ($return === TRUE)
				{
					return array();
				}
				return;
			}

			if ($return === TRUE)
			{
				return $lang;
			}

			$this->is_loaded[$langfile] = $idiom;
			$this->language = array_merge($this->language, $lang);
			log_message('info', 'Language file loaded: language/'.$idiom.'/'.$langfile);
			return TRUE;
	}


	public function line($line, $log_errors = TRUE)
	{
		$value = isset($this->language[$line]) ? $this->language[$line] : FALSE;

		// Because killer robots like unicorns!
		if ($value === FALSE && $log_errors === TRUE)
		{
			log_message('error', 'Could not find the language line "'.$line.'"');
		}

		return $value;
	}
}