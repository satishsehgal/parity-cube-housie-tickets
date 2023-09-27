class HousieTicket
  # HousieTicket Call Method to print a Housie ticket
  def call
    # Generate 2D array in Housie format
    ticket = generate_ticket
    # print a Housie ticket
    #print_housie_ticket(ticket)
  end


  private

  # Method to Generate 2D array in Housie format
  def generate_ticket
    ticket = Array.new(3) { Array.new(9) { 'X' } }
    occupy_columns = []
    (0..2).each do |row|
      random_numbers = (0..8).to_a.sample(5)
      (0..8).each do |col|
        if random_numbers.include?(col)
          first_value = col * 10
          first_value = 1 if col == 0 # Condition to first column contains numbers from 1 to 9
          last_value = col * 10 + 9
          last_value = col * 10 + 10 if col == 8 # Condition to last column contains numbers from 80 to 90
          
          # Condition to check last row element and change first_value(increasing order downwards)
          if row > 0 && ticket[row-1][col].to_i > 0
            # Change random first_value as per last row value
            # (eg- if last row value was 55 than frist value 56 and generate rand in range from 56 to 59) 
            first_value = ticket[row-1][col] + 1
          end
          # Assign random value to 2D array
          random_number = rand(first_value..last_value)
          ticket[row][col] = random_number
        end
      end
    end
    # Return final 2D array
    ticket
  end


  # Method to print a Housie ticket
  def print_housie_ticket(ticket)
    puts "Housie Ticket:"
    ticket.each do |row|
      row.each do |cell|
        print cell.to_s.rjust(3)
      end
      puts
    end
  end
end
