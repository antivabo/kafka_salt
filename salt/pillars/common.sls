zookeeper:
    hosts_target: "{{ grains['id'] }}"
    targeting_method: 'glob'
    restart_on_config: True
kafka:
    config:
        heap_initial_size: 1G
        heap_max_size: 1G
        restart_on_config_change: True
        properties:
            delete.topic.enable: 'true'
