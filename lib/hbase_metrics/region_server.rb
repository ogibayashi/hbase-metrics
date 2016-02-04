require 'hadoop_metrics2/api'

module HBaseMetrics
  class RegionServer
    include HadoopMetrics2::API

    def extract_region(target)
      ret = {  'regions' => [] }
      target.each do |k,v|
        if /^Namespace_(\w+)_table_([\w\.\-]+)_region_(\w+)_metric_(\w+)$/ =~ k
          r = ret['regions'].select{  |i| i['namespace'] == $1 && i['table'] == $2 && i['region'] == $3}.first
          unless r
            r = {
            'namespace' => $1,
            'table' => $2,
            'region' => $3,
            }
            ret['regions'] << r
          end
          r[$4] = v
        else
          ret[k] = v
        end
      end

      ret
    end
    
    def server
      query_jmx("Hadoop:service=HBase,name=RegionServer,sub=Server").first
    end

    def regions
      disable_snake_case {  
        target = query_jmx("Hadoop:service=HBase,name=RegionServer,sub=Regions").first
        extract_region(target)
      }
    end
    
    def ipc
      query_jmx('Hadoop:service=HBase,name=RegionServer,sub=IPC').first
    end

    def replication
      query_jmx("Hadoop:service=HBase,name=RegionServer,sub=Replication").first
    end
    
  end
end
