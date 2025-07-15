{# macros/calculate_percentage.sql #}
{% macro calculate_percentage(numerator, denominator) %}
  {% if denominator == 0 %}
    {{ return(none) }}
  {% else %}
    {{ return( (numerator * 100) / denominator ) }}
  {% endif %}
{% endmacro %}

{% macro convert_currency(value,currency) %}
    {% if currency=='eur'%}
        {{return (value*86/100)}}
    {% else %}
    {{ return (value*147) }}
  {% endif %}
{% endmacro %}
