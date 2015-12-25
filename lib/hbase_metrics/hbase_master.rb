require 'hadoop_metrics2/api'

module HBaseMetrics
  class HMaster
    include HadoopMetrics2::API

    def server
      query_jmx('Hadoop:service=HBase,name=Master,sub=Server').first
    end

    def assignment_manger
      query_jmx('Hadoop:service=HBase,name=Master,sub=AssignmentManger').first
    end
    
  end
end
