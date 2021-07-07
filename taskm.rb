require 'optparse'

def validate_line_n (line_n, str_count)

  raise "Wrong argument: line_n" if (line_n.class != Integer) || (line_n < 1) || (line_n > str_count)
  
end

options = {}
	OptionParser.new do |opts|
	  opts.banner = "Usage: taskm.rb [options]"


		opts.on("-l") do |l| 										#вывести список задач
			#line_num=0
			text=File.open('taskm.txt').read
			text.gsub!(/\r\n?/, "\n")
			if text.index('.') == nil 
				puts 'No tasks'
		    elsif
				text.each_line do |line|
					print "#{line}"
				end
			end
		end

	    opts.on("-a") do |a| 										#добавление новой задачи
		    text=File.open('taskm.txt').read 								#считаем кол-во строк для определения ид
		    text.gsub!(/\r\n?/, "\n")
		    line_num = text.split("\n").length
		      
		    puts "Enter new task:" 									#добавление
		    new_task = gets.chomp
		    line_num += 1
		    text=File.open('taskm.txt', 'a')
		    text.puts "#{line_num}. [ ] #{new_task}"
		    text.close
		      
		    #line_num=0 										#вывод результирующего файла
		    text=File.open('taskm.txt').read
		    text.gsub!(/\r\n?/, "\n")
		    text.each_line do |line|
		        print "#{line}"
		    end
	    end

		opts.on("-c", "--c LINE_N", Integer) do |line_n|            					#отметить завершенной
			text=File.open('taskm.txt').read
		    text.gsub!(/\r\n?/, "\n")
		    arr = text.split("\n")
		    
		    validate_line_n(line_n, arr.size)                      					#проверка аргумента 

		    arr[line_n-1].sub!('[ ]', '[x]')
		    File.open('taskm.txt', "w") {|file| file.puts arr }


		    #line_num=0 										#вывод результирующего файла
		    text=File.open('taskm.txt').read
		    text.gsub!(/\r\n?/, "\n")
		    text.each_line do |line|
		        print "#{line}"
		    end

  		end

        opts.on("-d", "--d LINE_N", Integer) do |line_n| 							#удаление выбранной строки

	        #line_n = 3 #строка к удалению

	        text=File.open('taskm.txt').read
	        text.gsub!(/\r\n?/, "\n")
	        arr = text.split("\n")
	        
	        validate_line_n(line_n, arr.size)                      						#проверка аргумента 

	        if line_n == arr.size
	          arr.pop
	        elsif
	          for i in line_n-1..arr.size-2
	            str  = arr[i]
	            str2 = arr[i+1]

	      
	            id, task = str.split('.')
	            id_n, task_n = str2.split('.')
	          
	            arr[i]=id << '.' << task_n

	          end
	          arr.pop
	        end 
	        #puts arr
	        File.open('taskm.txt', "w") {|file| file.puts arr } 
	        
		    #line_num=0 											#вывод результирующего файла
		    text=File.open('taskm.txt').read
		    text.gsub!(/\r\n?/, "\n")
			
			if text.index('.') == nil 
				puts 'No tasks'
		    elsif
				text.each_line do |line|
					print "#{line}"
				end
			end

        end


end.parse!




