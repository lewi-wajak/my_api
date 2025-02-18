require 'csv'

csv_file_path = Rails.root.join('db', 'volcanoes.csv')

CSV.foreach(csv_file_path, headers: true) do |row|
  Volcano.create(
    volcano_name: row['Volcano Name'],
    country: row['Country'],
    latitude: row['Latitude'].to_f,
    longitude: row['Longitude'].to_f,
    elevation: row['Elevation (m)'].to_i,
    primary_volcano_type: row['Type'],
    activity_evidence: row['Status'],
    last_known_eruption: row['Last Known Eruption'],
    year: row['year'].to_i,
    month: row['mo'].to_i,
    day: row['dy'].to_i,
    tsu: row['tsu'],
    eq: row['eq'],
    vei: row['vei'],
    deaths: row['deaths'].to_i,
    damage_mil: row['damage_mil'].to_f,
    houses_destroyed: row['houses_destroyed'].to_i,
    total_deaths: row['total_deaths'].to_i,
    total_damage_mil: row['total_damage_mil'].to_f
  )
end
