#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative '../lib/bs_ruby_regex/bs_file_accessor'
require_relative 'bs_test_constants'
require_relative 'bs_os_detector'

class BsFileAccessorTest < MiniTest::Test

  def setup
    @os = BsOsDetector.os
  end

  def test_encoding_from_file_default
    # Terminal file command shows
    # $ file sample-input.txt
    # sample-input.txt: ASCII text
    # $ file -I sample-input.txt
    # sample-input.txt: text/plain; charset=us-ascii

    # sample-input.txt team names don't have accented characters, but don't assume they can't.
    # In other words, don't assume file encoding will always be ASCII instead of UTF-8.
    # On Mac I used character viewer to drag accented characters into new file in MacVim
    # $ file sample-input-utf8.txt
    # sample-input-utf8.txt: UTF-8 Unicode text

    encoding_from_file = BsRubyRegex::BsFileAccessor.encoding_from_file('./sample-input.txt', nil)
    expected_result = nil
    if (:windows == @os)
      expected_result = Encoding.find('IBM437')
    else
      expected_result = Encoding.find('UTF-8')
    end
    assert_equal(expected_result, encoding_from_file)
  end

  def test_encoding_from_file_nil_utf_8
    encoding_from_file = BsRubyRegex::BsFileAccessor.encoding_from_file('./sample-input-utf8.txt', nil)
    expected_result = nil
    if (:windows == @os)
      expected_result = Encoding.find('IBM437')
    else
      expected_result = Encoding.find('UTF-8')
    end
    assert_equal(expected_result, encoding_from_file)
  end

  def test_encoding_from_file_utf_8
    encoding_from_file = BsRubyRegex::BsFileAccessor.encoding_from_file('./sample-input.txt', 'UTF-8')
    expected_result = Encoding.find('UTF-8')
    assert_equal(expected_result, encoding_from_file, "expect UTF-8 for any OS")
  end

  def test_string_from_file_encoding_nil
    actual_result = BsRubyRegex::BsFileAccessor.string_from_file('./sample-input.txt', nil)
    puts
    puts "file_string: #{actual_result}"
    assert_equal(GAMES_STRING_ASCII, actual_result)
  end

  def test_string_from_file_encoding_utf_8
    actual_result = BsRubyRegex::BsFileAccessor.string_from_file('./sample-input-utf8.txt', 'UTF-8')
    puts
    puts "file_string: #{actual_result}"
    assert_equal(GAMES_STRING_UTF8, actual_result)
  end

  def test_write
    # clean up before opening file
    if File.exists?('./junk.txt')
      File.delete('./junk.txt')
    end
    assert(!File.exists?('./junk.txt'))

    BsRubyRegex::BsFileAccessor.write(GAMES_STRING_ASCII, './junk.txt')

    assert(File.exists?('./junk.txt'))

    # On OS X in terminal, output file shows as us-ascii
    # $ file -I junk.txt
    # junk.txt: text/plain; charset=us-ascii
  end

  def test_write_utf8
    # clean up before opening file
    if File.exists?('./junk-utf8.txt')
      File.delete('./junk-utf8.txt')
    end
    assert(!File.exists?('./junk-utf8.txt'))

    BsRubyRegex::BsFileAccessor.write(GAMES_STRING_UTF8, './junk-utf8.txt')

    assert(File.exists?('./junk-utf8.txt'))

    # On OS X in terminal, output file shows as utf-8
    # $ file -I junk-utf8.txt
    # junk-utf8.txt: text/plain; charset=utf-8
  end

end
