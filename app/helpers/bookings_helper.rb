module BookingsHelper
  def booking_status_label(status)
    booking_status_span_generator(status)
  end

  private
    def booking_status_span_generator(status)
      case status
      when 0
        content_tag(:span, 'Buscando conductor', class: 'badge rounded-pill bg-warning text-dark')
      when 1
        content_tag(:span, 'Conductor en camino', class: 'badge bg-light text-dark')
      when 5
        content_tag(:span, 'Recogiendo paquete', class: 'badge bg-light text-dark')
      when 6
        content_tag(:span, 'Paquete a bordo', class: 'badge bg-light text-dark')
      when 7
        content_tag(:span, 'Entregando paquete', class: 'badge bg-light text-dark')
      when 4
        content_tag(:span, 'Pedido finalizado', class: 'badge rounded-pill bg-success')
      when 100
        content_tag(:span, 'Cancelado por conductor', class: 'badge rounded-pill bg-danger')
      when 102
        content_tag(:span, 'Cancelado por pasajero', class: 'badge rounded-pill bg-danger')
      when 101
        content_tag(:span, 'Expirado, no se encontró conductor', class: 'badge rounded-pill bg-dark')
      when 109
        content_tag(:span, 'Programado', class: 'badge bg-light text-dark')
      end
    end
end
