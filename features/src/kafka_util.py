# Copyright © 2021 Pavel Tisnovsky, Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""An interface to Apache Kafka done using kcat utility and Python interface to Kafka."""


import subprocess
import json

from kafka.admin import NewTopic
from kafka import KafkaProducer, KafkaConsumer
from kafka import KafkaAdminClient
from kafka.errors import UnknownTopicOrPartitionError, TopicAlreadyExistsError


class SendEventException(Exception):
    """Class representing an exception thrown when send event to Kafka fails."""

    def __init__(self, message):
        """Construct an exception for send to Kafka failure."""
        super().__init__(message)


def create_topic(hostname, topic_name):
    """Create a new Kafka topic."""
    topic = NewTopic(topic_name, 1, 1)
    admin_client = KafkaAdminClient(bootstrap_servers=hostname)
    try:
        outcome = admin_client.create_topics([topic])
        assert outcome.topic_errors[0][1] == 0, "Topic creation failure: {outcome}"
    except TopicAlreadyExistsError:
        print(f'{topic_name} topic already exists')


def send_event(bootstrap, topic, payload, headers=None):
    """Send an event to selected Kafka topic."""
    producer = KafkaProducer(
        bootstrap_servers=bootstrap
    )
    try:
        res = producer.send(
            topic,
            value=payload,
            headers=headers,
        )
        producer.flush()
        print("Result kafka send: ", res.get(timeout=10))
        producer.close()
    except Exception as e:
        print(f"Failed to send message {payload} to topic {topic}")
        producer.close()
        raise SendEventException(e)


def consume_event(bootstrap, topic, group_id=None):
    """Consume events in the given topic."""
    consumer = KafkaConsumer(
            bootstrap_servers=bootstrap,
            group_id=group_id,
    )
    consumer.subscribe(topics=topic)
    return consumer.poll()
