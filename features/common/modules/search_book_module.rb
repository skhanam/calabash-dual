require_relative 'base_module'

module SearchBookModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end


  def get_details_for_tile(row_num, tile_num)
    row_num=row_num.to_i-1
    tile_num=tile_num.to_i-1
    all_rows=$g_search_book["searchAndBook"]["listing"]["items"]
    all_tiles=all_rows[row_num.to_i]["tiles"]
    arr=[]
    all_tiles[tile_num]["labels"].each { |val2| arr.push val2["text"] }
    link=all_tiles[tile_num]["link"]
    return arr,link
  end

  def get_search_row_count
    $g_search_book["searchAndBook"]["listing"]["items"].count
  end

  def get_search_tile_count(row_num)
    row_num=row_num.to_i-1
    all_rows=$g_search_book["searchAndBook"]["listing"]["items"]
    all_rows[row_num.to_i]["tiles"].count
  end

  module Phone

    def self.included(receiver)
      puts self.name+"::#{$g_lang_mod}"
      receiver.send :include, Module.const_get(self.name+"::#{$g_lang_mod}")
    end

    module Eng
      include BaseModule

      def check_every_row_every_tile
        count=get_search_row_count.to_i
        for i in 1..count
          check_each_tile_of_row i
        end
      end

      def verify_search_book_screen
        if $g_firstchoice_app
          assert_wait_for_text @@search_and_book_title.upcase
        else
          assert_wait_for_text @@search_and_book_title
        end
        sleep 2
      end

      def check_each_tile_of_row row_num
        scroll_table_to_row row_num
        count=get_search_tile_count(row_num).to_i
        puts "Tile count #{count}"
        for num in 1..count.to_i
          arr,link=get_details_for_tile row_num, num
          puts "arr = #{arr} row_num #{row_num}, num #{num}"
          arr.each { |var| assert_wait_for_text var }
          return if count==1
          scroll_search_book_items row_num, num+1, arr.last
          sleep 1
        end
      end

      def navigate_to_sign_up_for_offers
        scroll_table_to_row 5
        assert_wait_for_text @@search_book_sign_up
        click_on_text @@search_book_latest_offers
      end

      def verify_sign_for_offers
        assert_wait_for_text @@welcome_help_no_holiday_email_header
        assert_wait_for_text @@welcome_help_no_holiday_email_body
      end
    end

  end
end