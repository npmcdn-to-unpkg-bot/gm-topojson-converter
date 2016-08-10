require 'find'
require './_config_.rb'

targets = []
Find.find("../#{$source}/") {|path|
  next unless path.end_with?('shp')
  target = File.basename(path.sub('shp', 'geojson'))
  targets << target
  print "ogr2ogr -f GeoJSON #{target} #{path}\n"
  print "topojson -o #{target.sub('geojson', 'topojson')} #{target}\n"
}
