from dataclasses import fields
from rest_framework import serializers
from todos import models


class TodoSerializier(serializers.ModelSerializer):
    class Meta:
        fields = (
            'id',
            'title',
            'description'
        )
        model = models.Todo