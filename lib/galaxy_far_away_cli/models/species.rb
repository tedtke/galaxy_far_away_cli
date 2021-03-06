class Species
    attr_accessor :name, :classification, :designation, :average_height, :hair_colors, :eye_colors, :language

    @@all = []
    def initialize(attrs)
         attrs.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
        save
    
    end

    def save
        @@all << self
    end

    def self.all
       @@all
    end

    def self.find_by_name(name)
        self.all.detect {|species| species.name.downcase.gsub("'", "") == name.downcase.gsub("'", "")}
        # binding.pry
    end

    def self.find_by_sentients
        self.all.select {|species_instance| species_instance.designation == "sentient" }
    end


end