{# macros/calculate_percentage.sql #}
{% macro calculate_percentage(numerator, denominator) %}
  {% if denominator == 0 %}
    {{ return(none) }}
  {% else %}
    {{ return( (numerator * 100) / denominator ) }}
  {% endif %}
{% endmacro %}